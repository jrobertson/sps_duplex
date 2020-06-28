#!/usr/bin/env ruby

# file: sps_duplex.rb

require 'sps-pub'
require 'sps-sub'


class SPSDuplex

  def initialize(host: 'localhost', port: '55000', topic: 'chan1', 
                 sub_topic: 'node1', pub_topic: 'node2', interactive: true)

        
    sps = SPSSub.new host: host, port: port, callback: self
    puts 'connecting ...'
    sleep 1 # give it a second to connect
    
    topic_path = [topic]
    
    if interactive then
      
      Thread.new { sps.subscribe topic: (topic_path + [sub_topic]).join('/') }

      @pub = SPSPub.new address: host, port: port
      
      topic_path << pub_topic
      @topic = topic_path.join('/')    
    else

      @pub = sps      
      @topic = (topic_path + [pub_topic]).join('/')         
      sps.subscribe topic: (topic_path + [sub_topic]).join('/')
      
    end

  end

  def send(msg)

    @pub.notice ("%s: %s" % [@topic, msg])

  end             
  
  # used by the callback routine
  #
  def ontopic(topic, msg)
    
    a = topic.split('/')
    sender = a.pop
    onincoming(sender, msg)

  end
    
  def onincoming(sender, msg)
    
    puts "%s: %s" % [sender, msg]
    
  end

end

if __FILE__ == $0 then

  channel = SPSDuplex.new port: 55000
  channel.send 'hello'

end
