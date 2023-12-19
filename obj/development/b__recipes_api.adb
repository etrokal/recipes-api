pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__recipes_api.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__recipes_api.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E081 : Short_Integer; pragma Import (Ada, E081, "system__os_lib_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__exceptions_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__containers_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "ada__io_exceptions_E");
   E032 : Short_Integer; pragma Import (Ada, E032, "ada__numerics_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "ada__strings_E");
   E065 : Short_Integer; pragma Import (Ada, E065, "ada__strings__maps_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__strings__maps__constants_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "interfaces__c_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "system__exceptions_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "system__object_reader_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "system__dwarf_lines_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__soft_links__initialize_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__traceback__symbolic_E");
   E031 : Short_Integer; pragma Import (Ada, E031, "system__img_int_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "system__img_uns_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Exception_Tracebacks : Integer;
      pragma Import (C, Exception_Tracebacks, "__gl_exception_tracebacks");
      Exception_Tracebacks_Symbolic : Integer;
      pragma Import (C, Exception_Tracebacks_Symbolic, "__gl_exception_tracebacks_symbolic");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Exception_Tracebacks := 1;
      Exception_Tracebacks_Symbolic := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := null;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E025 := E025 + 1;
      Ada.Containers'Elab_Spec;
      E048 := E048 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E076 := E076 + 1;
      Ada.Numerics'Elab_Spec;
      E032 := E032 + 1;
      Ada.Strings'Elab_Spec;
      E063 := E063 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E065 := E065 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E068 := E068 + 1;
      Interfaces.C'Elab_Spec;
      E053 := E053 + 1;
      System.Exceptions'Elab_Spec;
      E026 := E026 + 1;
      System.Object_Reader'Elab_Spec;
      E090 := E090 + 1;
      System.Dwarf_Lines'Elab_Spec;
      System.Os_Lib'Elab_Body;
      E081 := E081 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E021 := E021 + 1;
      E013 := E013 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E047 := E047 + 1;
      System.Img_Int'Elab_Spec;
      E031 := E031 + 1;
      E008 := E008 + 1;
      System.Img_Uns'Elab_Spec;
      E071 := E071 + 1;
      E058 := E058 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_recipes_api");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/marcelo/projects/ada/atlas/recipes_api/obj/development/recipes_api.o
   --   -L/home/marcelo/projects/ada/atlas/recipes_api/obj/development/
   --   -L/home/marcelo/projects/ada/atlas/recipes_api/obj/development/
   --   -L/home/marcelo/projects/ada/atlas/recipes_api/alire/cache/dependencies/dotenv_1.0.0_a19c7797/lib/
   --   -L/home/marcelo/projects/ada/atlas/recipes_api/alire/cache/dependencies/utilada_2.6.0_99ca46a1/lib/utilada_aws/static/
   --   -L/home/marcelo/projects/ada/atlas/recipes_api/alire/cache/dependencies/utilada_2.6.0_99ca46a1/lib/utilada_sys/static/
   --   -L/home/marcelo/projects/ada/atlas/recipes_api/alire/cache/dependencies/utilada_2.6.0_99ca46a1/lib/utilada_core/static/
   --   -L/home/marcelo/projects/ada/atlas/recipes_api/alire/cache/dependencies/aws_21.0.0_57fddf8f/install_dir/lib/aws.static/
   --   -L/home/marcelo/projects/ada/atlas/recipes_api/alire/cache/dependencies/ada_util_99ca46a1/lib/utilada_curl/static/
   --   -L/home/marcelo/.config/alire/cache/dependencies/gnat_native_13.2.1_788a01f9/lib/gcc/x86_64-pc-linux-gnu/13.2.0/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
