package com.yuan.client.command;

import com.yuan.client.dispatcher.IParseMessageCommand;
import com.yuan.client.domain.Request;
import com.yuan.client.domain.ResComm;
import com.yuan.client.domain.Response;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

@Service
public class UserLoginComm implements IParseMessageCommand {

    @Override
    public Response parseMessage(Request request) {
        System.out.println("处理请求中......");
        ResComm comm = new ResComm(1,"成功");
        Response response = new Response(request.getCommandType()).setCommon(comm);
        response.getDetails().put("a","收到");
        return response;
    }
}
