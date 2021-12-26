package com.lok.messenger;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class MessengerTest {
    @Test
    public void testGetMessage() {
        Messenger messenger = new Messenger();
        assertEquals(messenger.getMessage(), "HELLO WORLD!");
    }
}
