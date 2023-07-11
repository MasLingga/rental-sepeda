<?php
        namespace App\Http\Controllers\Back\Pengembalian;
        use Illuminate\Http\Request;
        use App\Http\Controllers\Controller;
        use App\Models\Pengembalian;
        use DB;
        use Hash;
        use Illuminate\Support\Arr;

        class PengembalianController extends Controller
        {
            /**
             * Display a listing of the resource.
             *
             * @return \Illuminate\Http\Response
             */
        
            public function index(Request $request)
            {
                $data = Pengembalian::orderBy("id","DESC")->get();
                return view("back.Pengembalian.index",compact("data"))
                    ->with("i", ($request->input("page", 1) - 1) * 5);
            }
        
            /**
             * Show the form for creating a new resource.
             *
             * @return \Illuminate\Http\Response
             */
        
            public function create()
            {
                return view("back.Pengembalian.create");
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
                
                
                $Pengembalian = Pengembalian::create($input);
               
            
                return redirect()->route("pengembalian.index")
                ->with("success","Pengembalian created successfully");
            
            }
        
        
            /**
                 * Display the specified resource.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
        
                public function show($id)
                {
                    $Pengembalian = Pengembalian::find($id);
                    return view("back.Pengembalian.show",compact("Pengembalian"));
                }
            

            
                /**
                 * Show the form for editing the specified resource.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function edit($id)
                {
                    $Pengembalian = Pengembalian::find($id);
                    return view("back.Pengembalian.edit",compact("Pengembalian"));
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

                    
                    
                    
                    $Pengembalian = Pengembalian::find($id);
                    $Pengembalian->update($input);
                
                    return redirect()->route("pengembalian.index")
                    ->with("success","Pengembalian updated successfully");
                
                }
            

                /**
                 * Remove the specified resource from storage.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function destroy($id)
                {
                    Pengembalian::find($id)->delete();
                    return redirect()->route("pengembalian.index")
                    ->with("success","Pengembalian deleted successfully");
                
                }
            }
        
        ?>