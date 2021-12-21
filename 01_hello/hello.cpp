
#include<systemc>
#include<cci_configuration>

using namespace sc_core;


// declare the module class
SC_MODULE (HelloSystemC)
{
    // module constructor
    SC_CTOR(HelloSystemC) 
    {
        // module process
        SC_THREAD(main_thread);
    }

    void main_thread(void)
    {
        SC_REPORT_INFO("TryLang", "Kumusta, SystemC World!");
    }
};


int sc_main(int sc_argc, char* sc_argv[])
{ 
    // instance of the module
    HelloSystemC helloModule("helloModule");
    
    // invoke the simulator
    sc_start();

    return 0;
}
