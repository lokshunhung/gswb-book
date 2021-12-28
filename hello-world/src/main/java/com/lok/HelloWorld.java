package com.lok;

import com.lok.messenger.Messenger;

public class HelloWorld {
    public static void main(String[] args) {
        var messenger = new Messenger();
        System.out.println(messenger.getMessage());
    }
}
