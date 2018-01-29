# Introducing the sps_duplex gem

The sps_duplex gem allows 2 way communication using the SimplePubSub broker.

## Example

### Running the SimplePubSub broker

    require 'simplepubsub'

    SimplePubSub::Broker.start port: '55000'

### Running a communications monitor

The communications monitor shows what messages are being published to the messaging broker.

    require 'sps-sub'

    sps = SPSSub.new host: '127.0.0.1', port: '55000'

    sps.subscribe(topic: '#') do |msg, topic|
      puts "%s: %s " % [topic, msg]
    end

### Running node 2

    require 'sps_duplex'

    chan = SPSDuplex.new host: '127.0.0.1', port: 55000


### Running node 1

    require 'sps_duplex'

    chan = SPSDuplex.new host: '127.0.0.1', port: 55000, sub_topic: 'node2', pub_topic: 'node1'


### Sending a message from node 2

    chan.send 'hello'

Observed (from node 1):

<pre>
node2: hello
</pre>

### Sending a message from node 1

    chan.send 'hello2'

Observed (from node 2):
<pre>
node1: hello2
</pre>

### Observing messages published

From the communications monitor screen the following output was observed:

<pre>
Connected
chan1/node2: hello 
chan1/node1: hello2 
</pre>

## Resources

* sps_duplex https://rubygems.org/gems/sps_duplex

chat communication messaging sps gem sps_duplex spsduplex
