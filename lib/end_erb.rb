# encoding: utf-8
require 'erb'

class EndERB
  class << self
    # for single template script using __END__ and DATA
    #
    # === Params
    #
    # * <tt>:hash</tt> - erb template variable hash
    #
    # === Example
    #
    #   def hoge
    #     hash = {
    #       hoge: '@hoge@',
    #       hige: '@hige@',
    #     }
    #     EndERB.apply(hash)
    #   end
    #
    #   puts hoge
    #
    #   __END__
    #   hoge=<%=hoge%>
    #   hige=<%=hige%>
    #
    # output
    #
    #   hoge=@hoge@
    #   hige=@hige@
    #
    def apply(hash)
      ERB.new(DATA.read).result(binding)
    end
  end
end
