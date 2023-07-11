<?php
        namespace App\Http\Controllers\Back\Peminjaman;
        use Illuminate\Http\Request;
        use App\Http\Controllers\Controller;
        use App\Models\Peminjaman;
        use DB;
        use Hash;
        use Illuminate\Support\Arr;

        class PeminjamanController extends Controller
        {
            /**
             * Display a listing of the resource.
             *
             * @return \Illuminate\Http\Response
             */
        
            public function index(Request $request)
            {
                $data = Peminjaman::orderBy("id","DESC")->get();
                return view("back.Peminjaman.index",compact("data"))
                    ->with("i", ($request->input("page", 1) - 1) * 5);
            }
        
            /**
             * Show the form for creating a new resource.
             *
             * @return \Illuminate\Http\Response
             */
        
            public function create()
            {
                return view("back.Peminjaman.create");
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
                
                
                $Peminjaman = Peminjaman::create($input);
               
            
                return redirect()->route("peminjaman.index")
                ->with("success","Peminjaman created successfully");
            
            }
        
        
            /**
                 * Display the specified resource.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
        
                public function show($id)
                {
                    $Peminjaman = Peminjaman::find($id);
                    return view("back.Peminjaman.show",compact("Peminjaman"));
                }
            

            
                /**
                 * Show the form for editing the specified resource.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function edit($id)
                {
                    $Peminjaman = Peminjaman::find($id);
                    return view("back.Peminjaman.edit",compact("Peminjaman"));
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

                    
                    
                    
                    $Peminjaman = Peminjaman::find($id);
                    $Peminjaman->update($input);
                
                    return redirect()->route("peminjaman.index")
                    ->with("success","Peminjaman updated successfully");
                
                }
            

                /**
                 * Remove the specified resource from storage.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function destroy($id)
                {
                    Peminjaman::find($id)->delete();
                    return redirect()->route("peminjaman.index")
                    ->with("success","Peminjaman deleted successfully");
                
                }
            }
        
        ?>