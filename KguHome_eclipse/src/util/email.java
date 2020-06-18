package util;



import javax.mail.Authenticator;

import javax.mail.PasswordAuthentication;



public class email extends Authenticator {



    @Override

    protected PasswordAuthentication getPasswordAuthentication() {

        return new PasswordAuthentication("futiled00@gmail.com","doden1706");

    }
}
    

