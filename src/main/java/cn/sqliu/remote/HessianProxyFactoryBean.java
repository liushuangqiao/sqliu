package cn.sqliu.remote;

import com.caucho.hessian.client.HessianProxyFactory;
import dev.xwolf.framework.common.util.ReflectUtils;
import org.aopalliance.intercept.MethodInvocation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HessianProxyFactoryBean extends
org.springframework.remoting.caucho.HessianProxyFactoryBean {
	
private final Logger logger = LoggerFactory.getLogger(HessianProxyFactoryBean.class);

public void setConnectTimeout(int connectTimeOut) {
try {
	HessianProxyFactory proxyFactory = (HessianProxyFactory) ReflectUtils
			.getValueByFieldName(this, "proxyFactory");
	proxyFactory.setConnectTimeout(connectTimeOut);

} catch (Exception e) {
	throw new RuntimeException("set connectTimout throws Excepton,",e);
}
}

public Object invoke(MethodInvocation invocation) throws Throwable{
	
 long begin=0;
 
 if(logger.isInfoEnabled()){
  begin=System.currentTimeMillis();
 }
 
 Object rval = super.invoke(invocation);
 
 if(logger.isInfoEnabled()){			 
	 long end=System.currentTimeMillis();
	 long dura=end-begin;	
	 Class clazz=getServiceInterface();

	 String className=clazz.getName();
	 String method=invocation.getMethod().getName();
	 Object[] obj=invocation.getArguments();
	 StringBuilder sb=new StringBuilder();
	 sb.append("Execution time= ");
	 sb.append(dura);
	 sb.append("  for invoke ");
	 sb.append(className);
	 sb.append(".");
	 sb.append(method);
	 sb.append("(");
	 sb.append(toString(obj));
	 sb.append(")");			
	 logger.info(sb.toString());
    }
 return rval;
 
}

private  String toString(Object ... params){
   String result="";
   if(params!=null){
	   StringBuilder sb=new StringBuilder();
	   for(Object param:params){
		   if(param!=null){
		   sb.append(param.toString());
		   }else{
			   sb.append("null");
		   }
		   sb.append(",");			   
	   }		   
		int length=sb.length();
		if(length>0){
			sb.deleteCharAt(length-1);
		}
	   result=sb.toString();
   }
   return result;
  
}


}
