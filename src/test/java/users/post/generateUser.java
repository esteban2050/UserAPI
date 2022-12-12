package users.post;

public class generateUser {

    public static String body(String name , String job)
    {
        return "{\"name\":\""+name+"\",\"job\":\""+job+"\"}";
    }

}
