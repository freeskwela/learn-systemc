
#include<systemc>

using namespace sc_core;


SC_MODULE (HelloSystemC) {  // declare the module class
    SC_CTOR(HelloSystemC) {  // module constructor
        SC_THREAD(main_thread);  // module process
    }

    void main_thread(void) {
        SC_REPORT_INFO("INFO", "Hello SystemC World!");
    }
};


int sc_main(int, char*[]) {
    HelloSystemC helloModule("helloModule");

    sc_start();

    return 0;
}
