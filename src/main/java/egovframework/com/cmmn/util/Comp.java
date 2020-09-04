package egovframework.com.cmmn.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.spi.LoggerFactory;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ConfigurableWebApplicationContext;

@Component("egovframework.com.cmmn.util.Comp")
public class Comp {
	
	private static final Log log = LogFactory.getLog(Comp.class);

	@Autowired private ConfigurableWebApplicationContext subContext;
	@Autowired private Environment env;

	public void main() {
	// ConfigurableWebApplicationContext 이용
	String[] profiles = subContext.getEnvironment().getActiveProfiles();
	for(String profile : profiles){
		log.debug( profile );
	}

	}
}