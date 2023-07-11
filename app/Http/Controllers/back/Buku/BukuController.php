<?php
        namespace App\Http\Controllers\Back\Sepeda;
        use Illuminate\Http\Request;
        use App\Http\Controllers\Controller;
        use App\Models\Sepeda;
        use App\Models\Category_sepeda;
        
        use DB;
        use Hash;
        use Illuminate\Support\Arr;

        class SepedaController extends Controller
        {
            /**
             * Display a listing of the resource.
             *
             * @return \Illuminate\Http\Response
             */
        
            public function index(Request $request)
            {
                $data = Sepeda::orderBy("id","DESC")->get();
                $res_kategori_buku = DB::select('select * from kategori_buku');

                return view("back.Buku.index",compact("data","res_kategori_buku"))
                    ->with("i", ($request->input("page", 1) - 1) * 5);
            }
        
            /**
             * Show the form for creating a new resource.
             *
             * @return \Illuminate\Http\Response
             */
        
            public function create()
            {
                $res_kategori_buku = Kategori_buku::orderBy("id","DESC")->get();
                dd($res_kategori_buku);
                return view("back.Buku.create");
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
                
                
                $Buku = Buku::create($input);
               
            
                return redirect()->route("buku.index")
                ->with("success","Buku created successfully");
            
            }
        
        
            /**
                 * Display the specified resource.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
        
                public function show($id)
                {
                    $Buku = Buku::find($id);
                    return view("back.Buku.show",compact("Buku"));
                }
            

            
                /**
                 * Show the form for editing the specified resource.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function edit($id)
                {
                    $Buku = Buku::find($id);
                    return view("back.Buku.edit",compact("Buku"));
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

                    
                    
                    
                    $Buku = Buku::find($id);
                    $Buku->update($input);
                
                    return redirect()->route("buku.index")
                    ->with("success","Buku updated successfully");
                
                }
            

                /**
                 * Remove the specified resource from storage.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function destroy($id)
                {
                    Buku::find($id)->delete();
                    return redirect()->route("buku.index")
                    ->with("success","Buku deleted successfully");
                
                }
            }
        
        ?>