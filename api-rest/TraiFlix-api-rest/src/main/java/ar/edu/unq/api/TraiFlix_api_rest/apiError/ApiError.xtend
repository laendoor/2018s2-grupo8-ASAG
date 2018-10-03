package ar.edu.unq.api.TraiFlix_api_rest.apiError

class ApiError  extends Error{
	
	String name
	Integer status
	String errorCode
	
	new(String name, Integer status, String errorCode){
		super(name);
		this.name = name;
		this.status = status;
		this.errorCode = errorCode;
	}
	
	
}


