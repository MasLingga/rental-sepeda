<?php
        namespace App\Http\Controllers\Back\Pustakawan;
        use Illuminate\Http\Request;
        use App\Http\Controllers\Controller;
        use App\Models\Pustakawan;
        use DB;
        use Hash;
        use Illuminate\Support\Arr;

        class PustakawanController extends Controller
        {
            /**
             * Display a listing of the resource.
             *
             * @return \Illuminate\Http\Response
             */
        
            public function index(Request $request)
            {
                $data = Pustakawan::orderBy("id","DESC")->get();
                return view("back.Pustakawan.index",compact("data"))
                    ->with("i", ($request->input("page", 1) - 1) * 5);
            }
        
            /**
             * Show the form for creating a new resource.
             *
             * @return \Illuminate\Http\Response
             */
        
            public function create()
            {
                return view("back.Pustakawan.create");
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
                
                
                $Pustakawan = Pustakawan::create($input);
               
            
                return redirect()->route("pustakawan.index")
                ->with("success","Pustakawan created successfully");
            
            }
        
        
            /**
                 * Display the specified resource.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
        
                public function show($id)
                {
                    $Pustakawan = Pustakawan::find($id);
                    return view("back.Pustakawan.show",compact("Pustakawan"));
                }
            

            
                /**
                 * Show the form for editing the specified resource.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function edit($id)
                {
                    $Pustakawan = Pustakawan::find($id);
                    return view("back.Pustakawan.edit",compact("Pustakawan"));
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

                    
                    
                    
                    $Pustakawan = Pustakawan::find($id);
                    $Pustakawan->update($input);
                
                    return redirect()->route("pustakawan.index")
                    ->with("success","Pustakawan updated successfully");
                
                }
            

                /**
                 * Remove the specified resource from storage.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function destroy($id)
                {
                    Pustakawan::find($id)->delete();
                    return redirect()->route("pustakawan.index")
                    ->with("success","Pustakawan deleted successfully");
                
                }
            }
        
        ?>