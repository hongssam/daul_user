package egovframework.com.cmmn.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AopLogging {
	private static final Logger logger = LoggerFactory.getLogger(AopLogging.class);
//	
//	@Before("excution(public * *(..))")
//	public void startLog(JoinPoint jp) {
//		
//			logger.info("1:" + Arrays.toString(jp.getArgs()));
//	}

}
