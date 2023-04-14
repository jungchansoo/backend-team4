package org.studywithme.util;

import java.util.Random;

public class AuthUtil {
	public int makeRandomNumber() {
        Random random = new Random();
        return 100000 + random.nextInt(900000);
	}
}
