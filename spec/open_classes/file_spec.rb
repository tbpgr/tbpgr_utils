# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe File do
  context :insert_bom do
    INSERT_BOM_TMP = 'insert_bom_tmp'
    FILE_CONTENTS = <<-EOS
タイトル1,タイトル2,タイトル3
行1_1,行1_2,行1_3
行2_1,行2_2,行2_3
    EOS

    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        input: 'input',
        output: 'output',
        src: FILE_CONTENTS,
        expected: [0xEF, 0xBB, 0xBF],
      },
      {
        case_no: 2,
        case_title: 'if no output-file, then write to input-file case',
        input: 'input',
        output: nil,
        src: FILE_CONTENTS,
        expected: [0xEF, 0xBB, 0xBF],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          File.insert_bom c[:input], c[:output]

          # -- then --
          c[:output] = c[:input] if c[:output].nil?
          actual = File.read(c[:output])
          base_bytes = []
          actual.bytes.each_with_index do |v, index|
            if index < 3
              expect(v).to eq(c[:expected][index])
            else
              base_bytes << v
            end
          end
          expect(base_bytes).to eq(c[:src].bytes.to_a)
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
        Dir.mkdir(INSERT_BOM_TMP) unless File.exists?(INSERT_BOM_TMP)
        Dir.chdir(INSERT_BOM_TMP)
        File.open(c[:input], 'w:UTF-8') { |f|f.print c[:src] }
      end

      def case_after(c)
        # implement each case after
        Dir.chdir('../')
        return unless File.exists? INSERT_BOM_TMP
        FileUtils.rm_rf("./#{INSERT_BOM_TMP}")
      end
    end
  end
end
