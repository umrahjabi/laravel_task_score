<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Team;
use App\Models\Match;
use App\Models\TeamMatch;
use App\Models\Player;
use Illuminate\Support\Collection;
use DB;
class HomeController extends Controller
{
    //
    public function player_history($id){
    	$result = [];
    	//dd($id);
    	$result[0] = count(TeamMatch::Select(DB::raw('count(*) as total'))->where('player_id',$id)->groupBy('match_id')->get()); 
    	$result[1] = TeamMatch::where('player_id',$id)->max('score');
    	$result[2] = TeamMatch::where('player_id',$id)->sum('score'); 

    	return $result;
    }
    public function index()
    {
    	$data = Team::with('players')->get();
    	foreach ($data as $key => $value) {
    		foreach ($value->players as $key1 => $value1) {
    		 $data[$key]->players[$key1]->player_history = $this->player_history($value1->id);
    		}
    	}
    	//dd($data[0]->players[0]['player_history']);
    	$match = Match::with(['team1'])->orderBy('id','DESC')->get();
    	foreach ($match as $key => $value) {
    		$match[$key]->team1_name = Team::find($value->team1)->name;
    		$match[$key]->team2_name = Team::find($value->team2)->name;
    		$players1 = Player::where('team_id',$value->team1)->get()->pluck('id');
    		$players2 = Player::where('team_id',$value->team2)->get()->pluck('id');
    		$match[$key]->score_team1 = TeamMatch::where('match_id',$value->id)->whereIn('player_id',$players1)->sum('score');
    		$match[$key]->score_team2 = TeamMatch::where('match_id',$value->id)->whereIn('player_id',$players2)->sum('score');
    	}
    	
    	return view('welcome',compact('data','match'));
    }
    public function matchFixtures(Request $request){
    	$check = Match::where(function($query) use($request){
    		$query->where('team1',$request->team_id[0])->orWhere('team1',$request->team_id[1]);
    	})->orWhere(function($query) use($request){
    		$query->where('team2',$request->team_id[0])->orWhere('team2',$request->team_id[1]);
    	})->get()->toArray();
    	$check = collect($check);
    	//dd($check);
    	$filter = $check->filter(function($value, $key) {
		    if ($value['status'] == 0) {
		        return true;
		    }
		});
    	//dd($filter);
    	if(count($filter)>0){
    		return redirect()->back()->with('error',"Selected team already Running");
    	}else{
    		$team = Match::create(['team1'=>$request->team_id[0],'team2'=>$request->team_id[1],'status'=>0]);
    		$team1 = Player::where('team_id',$request->team_id[0])->get()->pluck('id');
    		$team2 = Player::where('team_id',$request->team_id[1])->get()->pluck('id');
    		foreach ($team1 as $key => $value) {
    			TeamMatch::create(['match_id'=>$team->id,'player_id'=>$value,'score'=>0]);
    		}
    		foreach ($team2 as $key => $value) {
    			TeamMatch::create(['match_id'=>$team->id,'player_id'=>$value,'score'=>0]);
    		}
    		return redirect()->back()->with('succes',"Match Created.");
    	}
    	
    }
}
