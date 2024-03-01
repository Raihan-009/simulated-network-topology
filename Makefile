namespaces:
	@ sudo ip netns add red
	@ sudo ip netns add blue
	@ sudo ip netns add router

bridges:
	@ sudo ip link add br-red type bridge
	@ sudo ip link add br-blue type bridge
	@ sudo ip link set dev br-red up
	@ sudo ip link set dev br-blue up

cables:
	@ sudo ip link add v-red type veth peer name v-red-ns
	@ sudo ip link add v-blue type veth peer name v-blue-ns
	@ sudo ip link add vr-red type veth peer name vr-red-ns
	@ sudo ip link add vr-blue type veth peer name vr-blue-ns

interfaces:
	@ sudo ip link set v-red-ns netns red
	@ sudo ip link set v-blue-ns netns blue
	@ sudo ip link set v-red master br-red
	@ sudo ip link set v-blue master br-blue
	@ sudo ip link set vr-red master br-red
	@ sudo ip link set vr-blue master br-blue
	@ sudo ip link set vr-red-ns netns router
	@ sudo ip link set vr-blue-ns netns router

ipaddr:
	@ sudo ip netns exec red ip addr add 10.11.0.2/24 dev v-red-ns
	@ sudo ip netns exec blue ip addr add 10.12.0.3/24 dev v-blue-ns
	@ sudo ip netns exec router ip addr add 10.11.0.1/24 dev vr-red-ns
	@ sudo ip netns exec router ip addr add 10.12.0.1/24 dev vr-blue-ns

state:
	@ sudo ip netns exec red ip link set dev v-red-ns up
	@ sudo ip netns exec blue ip link set dev v-blue-ns up
	@ sudo ip netns exec router ip link set dev vr-red-ns up
	@ sudo ip netns exec router ip link set dev vr-blue-ns up
	@ sudo ip link set dev v-red up
	@ sudo ip link set dev v-blue up
	@ sudo ip link set dev vr-red up
	@ sudo ip link set dev vr-blue up

routes:
	@ sudo ip netns exec red ip route add default via 10.11.0.1
	@ sudo ip netns exec blue ip route add default via 10.12.0.1

ping:
	@ sudo ip netns exec red ping -c 4 10.12.0.3


delete:
	@ sudo ip netns delete red
	@ sudo ip netns delete blue
	@ sudo ip netns delete router
	@ sudo ip link delete br-red type bridge
	@ sudo ip link delete br-blue type bridge