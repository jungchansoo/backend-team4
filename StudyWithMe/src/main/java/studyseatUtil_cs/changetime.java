package studyseatUtil_cs;


public class changetime {
	public String time_longtoString(long time){
		boolean minuscheck = false;
		if(time < 0) minuscheck = true;
		int hour = Math.abs((int)time/60);
		int min = Math.abs((int)time%60);
		String strhour = Integer.toString(hour);
		String strmin = Integer.toString(min);
		
		if(hour < 10)
			strhour = '0' + strhour;
		
		if(min < 10)
			strmin = '0' + strmin;
		
		if(minuscheck)
			strhour = '-' + strhour;
		return strhour + ":" + strmin;
	}
}
