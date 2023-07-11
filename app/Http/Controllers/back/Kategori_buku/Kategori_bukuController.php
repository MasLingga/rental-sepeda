<?php
        namespace App\Http\Controllers\Back\Kategori_buku;
        use Illuminate\Http\Request;
        use App\Http\Controllers\Controller;
        use App\Models\Kategori_buku;
        use DB;
        use Hash;
        use Illuminate\Support\Arr;

        class Kategori_bukuController extends Controller
        {
            /**
             * Display a listing of the resource.
             *
             * @return \Illuminate\Http\Response
             */
        
            public function index(Request $request)
            {
                $data = Kategori_buku::orderBy("id","DESC")->get();
                return view("back.Kategori_buku.index",compact("data"))
                    ->with("i", ($request->input("page", 1) - 1) * 5);
            }
        
            /**
             * Show the form for creating a new resource.
             *
             * @return \Illuminate\Http\Response
             */
        
            public function create()
            {
                return view("back.Kategori_buku.create");
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
                
                
                $Kategori_buku = Kategori_buku::create($input);
               
            
                return redirect()->route("kategori_buku.index")
                ->with("success","Kategori_buku created successfully");
            
            }
        
        
            /**
                 * Display the specified resource.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
        
                public function show($id)
                {
                    $Kategori_buku = Kategori_buku::find($id);
                    return view("back.Kategori_buku.show",compact("Kategori_buku"));
                }
            

            
                /**
                 * Show the form for editing the specified resource.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function edit($id)
                {
                    $Kategori_buku = Kategori_buku::find($id);
                    return view("back.Kategori_buku.edit",compact("Kategori_buku"));
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

                    
                    
                    
                    $Kategori_buku = Kategori_buku::find($id);
                    $Kategori_buku->update($input);
                
                    return redirect()->route("kategori_buku.index")
                    ->with("success","Kategori_buku updated successfully");
                
                }
            

                /**
                 * Remove the specified resource from storage.
                 *
                 * @param  int  $id
                 * @return \Illuminate\Http\Response
                 */
            
                public function destroy($id)
                {
                    Kategori_buku::find($id)->delete();
                    return redirect()->route("kategori_buku.index")
                    ->with("success","Kategori_buku deleted successfully");
                
                }
            }
        
        ?>