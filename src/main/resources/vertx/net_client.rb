include_class 'io.vertx.core.metrics.Measured'
include_class 'io.vertx.core.net.NetSocket'
require 'vertx/util/utils.rb'
# Generated from io.vertx.core.net.NetClient
module Vertx
  class NetClient
    include Vertx::Measured
    def initialize(j_del)
      @j_del = j_del
    end
    def j_del
      @j_del
    end
    def metric_base_name()
      return @j_del.metricBaseName()
    end
    def metrics()
      return Java::IoVertxLangJruby::Helper.adaptingMap(@j_del.metrics(), Proc.new { |val| Vertx::Util::Utils.from_object(val) }, Proc.new { |val| Vertx::Util::Utils.to_json_object(val) })
    end
    def connect(port,host,connect_handler)
      if port != nil && port.class == Fixnum
        if host != nil && host.class == String
          if connect_handler != nil && connect_handler.class == Proc
            @j_del.connect(port,host,(Proc.new { |ar| connect_handler.call(ar.failed ? ar.cause : nil, ar.succeeded ? Vertx::NetSocket.new(ar.result) : nil) }))
            return self
          end
          raise ArgumentError, 'dispatch error'
        end
        raise ArgumentError, 'dispatch error'
      end
      raise ArgumentError, 'dispatch error'
    end
    def close()
      return @j_del.close()
    end
  end
end
