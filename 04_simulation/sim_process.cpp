
#include<systemc>

using namespace sc_core;


SC_MODULE(Process)
{
    // declares a clock
    sc_clock clk;
    // instantiate a clock with 1 sec periodicity
    SC_CTOR(Process) : clk("clk", 1, SC_SEC)
    {
        // register a method
        SC_METHOD(method);
        // register a thread
        SC_THREAD(thread);
        // register a clocked thread
        SC_CTHREAD(cthread, clk);
    }

    // define the method member function
    void method(void)
    {
        // no while loop
        std::cout << "method triggered @ " << sc_time_stamp() << std::endl;
        // trigger after 1 sec
        next_trigger(sc_time(1, SC_SEC));
    }

    // define the thread member function
    void thread(void)
    {
        // infinite loop
        while(true)
        {
            std::cout << "thread triggered @ " << sc_time_stamp() << std::endl;
            wait(1, SC_SEC);
        }
    }

    // define the cthread member function
    void cthread(void)
    {
        // inifinite loop
        while(true)
        {
            std::cout << "cthread triggered @ " << sc_time_stamp() << std::endl;
            // wait for next clk event, which come after 1 sec
            wait();
        }
    }
};


int sc_main(int sc_argc, char* sc_argv[])
{ 
    // init module
    Process process("process");
    std::cout << "execution phase begins @ " << sc_time_stamp() << std::endl;
    
    // run the simulator for 2 seconds
    sc_start(2, SC_SEC);
    std::cout << "execution phase ends @ " << sc_time_stamp() << std::endl;

    return 0;
}
