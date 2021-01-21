<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">

       <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
        <link rel="stylesheet" href="{{asset('public/assets/fonts/font-awesome/css/font-awesome.min.css')}}">
        <link rel="stylesheet" href="{{asset('public/assets/css/jquery.multiselect.css')}}">
        <link rel="stylesheet" href="{{asset('public/assets/css/vendor.min.css')}}">
        <link rel="stylesheet" href="{{asset('public/assets/css/elephant.min.css')}}">
        <link rel="stylesheet" href="{{asset('public/assets/css/application.min.css')}}">
        <link rel="stylesheet" href="{{asset('public/assets/css/iEdit.css')}}">
        <link rel="stylesheet" href="{{asset('public/assets/css/style.css')}}">
       

        <style>
            body {
                font-family: 'Nunito';
            }
        </style>
    </head>
    <body class="antialiased">
        <div class="">
            @if (Route::has('login'))
                <div class="hidden fixed top-0 right-0 px-6 py-4 sm:block">
                    @auth
                        <a href="{{ url('/home') }}" class="text-sm text-gray-700 underline">Home</a>
                    @else
                        <a href="{{ route('login') }}" class="text-sm text-gray-700 underline">Login</a>

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}" class="ml-4 text-sm text-gray-700 underline">Register</a>
                        @endif
                    @endif
                </div>
            @endif

            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <p style="color: red;">{{Session::get('error')}}</p>
                        <p style="color: green;">{{Session::get('success')}}</p>
                        <form action="{{url('match-fixtures')}}" id="submit-form" method="post">
                            @csrf
                        @foreach($data as $value)
                        <ul>
                         <input type="checkbox" name="team_id[]" value="{{$value->id}}" class="team_id">   {{$value->name}}
                            @foreach($value->players as $play)
                            <li>{{$play->first_name." ".$play->last_name}} - History(Total Match : {{$play->player_history[0] ." Highest Score : ".$play->player_history[1]." Total Run : ".$play->player_history[2]}})</li>
                            @endforeach
                        </ul>
                        @endforeach
                        <button type="button" onclick="matchFix()">Macth Fixtures</button>
                        </form>
                    </div>
                    <div class="col-sm-6">
                        <p></p>
                        <p></p>
                        <h3>All Match</h3>
                        <table class="table">
                            <tr><th>SrNo.</th><th>Team1</th><th>Team2</th><th>Team1 Score</th><th>Team2 Score</th><th>Status</th>
                            </tr>
                            @foreach($match as $key=>$value)
                            <tr><td>{{++$key}}</td><td>{{$value->team1_name}}</td><td>{{$value->team2_name}}</td><td>{{$value->score_team1}}</td><td>{{$value->score_team2}}</td><td>
                                @if($value->status==1)
                               <span class="text-success"> Complete </span>
                                @else
                               <span class="text-danger"> Running </span>
                                @endif
                            </td></tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>          
            </div>
        </div>
    </div>
        <script src="{{asset('public/assets/js/jquery.min.js')}}"></script>
        <script src="{{asset('public/assets/js/vendor.min.js')}}"></script>
        <script src="{{asset('public/assets/js/elephant.min.js')}}"></script>
        <script src="{{asset('public/assets/js/application.min.js')}}"></script>
        <script src="{{asset('public/assets/js/jquery.multiselect.js')}}"></script>
        <script src="{{asset('public/assets/js/iEdit.js')}}"></script>
        <script src="{{asset('public/assets/js/custom.js')}}"></script>
        <script src="{{asset('public/assets/js/step-form.js')}}"></script>
        <script src="{{asset('public/assets/js/canvasjs.min.js')}}"></script>
        <script type="text/javascript">
            function matchFix(argument) {
                
                var val = [];
                $('.team_id:checked').each(function(i){
                  val[i] = $(this).val();
                });
                if(val.length!=2){
                    alert("Please select atleast 2 team.");
                    return false;
                }
                $("#submit-form").submit();
            }
        </script>
    </body>
</html>
