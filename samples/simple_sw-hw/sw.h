
#ifndef __SIMPLE_SW__
#define __SIMPLE_SW__

#include<systemc>

using namespace sc_core;

// software process element module
SC_MODULE(SW)
{
    sc_in<int> in_port;  // data recieving port
    sc_event evt_sw;
    int RXD;
    bool cpu_busy;  // CPU is occupied flag

    SC_HAS_PROCESS(SW);
    SW(sc_module_name name) : sc_module(name), cpu_busy(false)
    {
        SC_THREAD(sw_isr);
        dont_initialize();
        sensitive << in_port;  // static sensitivity

        SC_THREAD(sw_output);
        dont_initialize();
        sensitive << evt_sw;
    }

    void sw_isr(void)
    {
        for (;;)
        {
            if(!cpu_busy)
            {
                cpu_busy = true;
                std::cout << sc_time_stamp() << " sw_isr runs" << std::endl;
                RXD = in_port->read();
                wait(1, SC_US);  // wait for delay
                cpu_busy = false;
                evt_sw.notify();  // trigger sw_func()
            }
            wait();  // revive static sensitivity
        }
    }

    void sw_output(void)
    {
        for(;;)
        {
            if(!cpu_busy)
            {
                cpu_busy = true;
                std::cout << sc_time_stamp() << " sw_output data: " << RXD << std::endl;
                wait(2, SC_US);
                cpu_busy = false;
            }
            wait();
        }
    }
};

#endif  // __SIMPLE_SW__
