<?php
        namespace App\Http\Controllers\Back\Admin;
        use Illuminate\Http\Request;
        use App\Http\Controllers\Controller;
        use App\Models\Admin;
        use DB;
        use Hash;
        use Illuminate\Support\Arr;

        class AdminController extends Controller
        {
            /**
             * Display a listing of the resource.
             *
             * @return \Illuminate\Http\Response
             */
        
            public function index(Request $request)
            {
                $data = Admin::orderBy("id","DESC")->get();
                return view("back.tbl_admin.index",compact("data"))
                    ->with("i", ($request->input("page", 1) - 1) * 5);
            }
        
            /**
             * Show the form for creating a new resource.
             *
             * @return \Illuminate\Http\Response
             */
        
            public function create()
            {
                return view("back.tbl_admin.create");
            }
        
        
        
            /**
             * Store a newly created resource in storage.
             *
             * @param  \Illuminate\Http\Request  $request
             * @return \Illuminate\Http\Response
             */
        
            public function store(Request $request)
            {
               
                    
                $input = $request->all();
                
                
                $Anggota = Admin::create($input);
               
            
                return redirect()->route("tbl_admin.index")
                ->with("success","Admin created successfully");
            
            }
        
        
            /**
                 * Display the specified resource.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
        
                public function show($id)
                {
                    $Anggota = Admin::find($id);
                    return view("back.tbl_admin.show",compact("tbl_admin"));
                }
            

            
                /**
                 * Show the form for editing the specified resource.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function edit($id)
                {
                    $Admin = Admin::find($id);
                    return view("back.tbl_admin.edit",compact("tbl_admin"));
                }
            

            
                /**
                 * Update the specified resource in storage.
                 *
                 * @param  \Illuminate\Http\Request  $request
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function update(Request $request, $id)
                {
                
                   
                        
                        

                    $input = $request->all();

                    
                    
                    
                    $Admin = Admin::find($id);
                    $Admin->update($input);
                
                    return redirect()->route("tbl_admin.index")
                    ->with("success","Admin updated successfully");
                
                }
            

                /**
                 * Remove the specified resource from storage.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function destroy($id)
                {
                    Admin::find($id)->delete();
                    return redirect()->route("tbl_admin.index")
                    ->with("success","Admin deleted successfully");
                
                }
            }
        
        ?>