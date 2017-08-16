package com.system.luosimao;

import javax.ws.rs.core.MediaType;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;
import com.sun.jersey.core.util.MultivaluedMapImpl;
import com.taxi.base.ZConstants;

/**
 * 
 * @author Administrator
 */
public class ZAsyncSms {

	public static String key = ZConstants.LUOSIMAO_KEY;

	public static String sendEms(String phone, String msg) {
		// just replace key here
		Client client = Client.create();
		client.addFilter(new HTTPBasicAuthFilter("api", ZConstants.LUOSIMAO_KEY));
		WebResource webResource = client.resource("http://sms-api.luosimao.com/v1/send.json");
		MultivaluedMapImpl formData = new MultivaluedMapImpl();
		formData.add("mobile", phone);
		formData.add("message", msg + "【南皮县出租车公司】");
		ClientResponse response = webResource.type(MediaType.APPLICATION_FORM_URLENCODED).post(ClientResponse.class, formData);

		String textEntity = response.getEntity(String.class);
		int status = response.getStatus();
		// System.out.print(textEntity);
		// System.out.print(status);
		return textEntity;
	}

	private String testStatus() {
		Client client = Client.create();
		client.addFilter(new HTTPBasicAuthFilter("api", ZConstants.LUOSIMAO_KEY));
		WebResource webResource = client.resource("http://sms-api.luosimao.com/v1/status.json");
		MultivaluedMapImpl formData = new MultivaluedMapImpl();
		ClientResponse response = webResource.get(ClientResponse.class);
		String textEntity = response.getEntity(String.class);
		int status = response.getStatus();
		// System.out.print(status);
		// System.out.print(textEntity);
		return textEntity;
	}

}