package com.yuan.client.dispatcher;

import com.yuan.client.domain.Request;
import com.yuan.client.domain.Response;

public interface IParseMessageCommand {

    public Response parseMessage(Request request);
}
