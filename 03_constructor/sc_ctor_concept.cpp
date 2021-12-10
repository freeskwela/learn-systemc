
#include <systemc>

using namespace sc_core;


SC_MODULE (Module_A)
{
    // constructor taking only module name
    SC_CTOR (Module_A)
    {
        // register member function to SystemC simulation kernel
        SC_METHOD (func_a);
    }

    // member function with no input, no output
    void func_a()
    {
        std::cout << name() << std::endl;
    }
};


SC_MODULE (Module_B)
{
    // constructor
    SC_CTOR (Module_B)
    {
        // register member function
        SC_METHOD (func_b);
    }

    // declare member function
    void func_b(void);
};

// definition of member function
void Module_B::func_b(void)
{
    std::cout << this->name() << std::endl;
}


SC_MODULE (Module_C)
{
    const int i;
    // constructor taking more arguments
    SC_CTOR (Module_C);
    // explicit constructor
    Module_C(sc_module_name name, int i) : sc_module(name), i(i)
    {
        SC_METHOD (func_c);
    }

    void func_c(void)
    {
        std::cout << name() << ", i = " << i << std::endl;
    }
};


int sc_main(int sc_argc, char* sc_argv[])
{ 
    // instance of the module
    Module_A mod_A("mod_A");
    Module_B mod_B("mod_B");
    Module_C mod_C("mod_C", 1);
    
    // invoke the simulator
    sc_start();

    return 0;
}
