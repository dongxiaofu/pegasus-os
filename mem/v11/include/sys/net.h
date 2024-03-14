#ifndef _PEGASUS_OS_NET_H
#define _PEGASUS_OS_NET_H

typedef struct {
	unsigned char prx:1;	// PACKET RECEIVED: Indicates packet received with no errors.
	unsigned char ptx:1;	// PACKET TRANSMITTED: Indicates packet transmitted with no errors.
	unsigned char rxe:1;	// RECEIVE ERROR: Indicates that a packet was received with one or more of the following errors:ÐCRC Error;ÐFrame Alignment Error;ÐFIFO Overrun;ÐMissed Packet.
	unsigned char txe:1;	// TRANSMIT ERROR: Set when packet transmitted with one or more of the following errors:ÐExcessive Collisions;ÐFIFO Underrun.
	unsigned char ovw:1;	// OVERWRITE WARNING: Set when receive buffer ring storage resources have been exhausted. (Local DMA has reached Boundary Pointer).
	unsigned char cnt:1;	// COUNTER OVERFLOW: Set when MSB of one or more of the Network Tally Counters has been set.
	unsigned char rdc:1;	// REMOTE DMA COMPLETE: Set when Remote DMA operation has been completed.
	unsigned char rst:1;	// RESET STATUS: Set when NIC enters reset state and cleared when a Start Command is issued to the CR. This bit is also set when a Receive Buffer Ring overflow occurs and is cleared when one or more packets have been removed from the ring. Writing to this bit has no effect.NOTE: This bit does not generate an interrupt, it is merely a status indicator.
} interrupt_status;


#endif
