
#include<systemc>

using namespace sc_core;


// module defined using struct
struct ModuleStruct : public sc_module
{
    SC_CTOR (ModuleStruct)
    {
        std::cout << name() << " constructor" << std::endl;
    }
};


// module defined using class
class ModuleClass : public sc_module
{
    public: SC_CTOR (ModuleClass)
    {
        std::cout << name() << " constructor" << std::endl;
    }
};


// module defined using SC_MODULE
SC_MODULE (ModuleScModule)
{
    SC_CTOR (ModuleScModule)
    {
        std::cout << name() << " constructor" << std::endl;
    }
};


int sc_main(int sc_argc, char* sc_argv[])
{ 
    // instance of the module
    ModuleStruct modStruct("modStruct");
    ModuleClass modClass("modClass");
    ModuleScModule modScMod("modScMod");
    
    // invoke the simulator
    sc_start();

    return 0;
}
