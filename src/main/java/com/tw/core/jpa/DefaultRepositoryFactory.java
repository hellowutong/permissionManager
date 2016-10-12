package com.tw.core.jpa;

import javax.persistence.EntityManager;
import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.core.RepositoryInformation;
import org.springframework.data.repository.core.RepositoryMetadata;
import org.springframework.util.Assert;

/**
 * 
* @ClassName: DefaultRepositoryFactory 
<<<<<<< HEAD
* @Description: 扩展JpaRepositoryFactory,使其调用自定义的GenericRepository实现
* @author TonyWoo
* @date 2016年2月20日 下午12:27:02 
=======
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author TonyWoo
* @date 2016�?2�?20�? 下午12:27:02 
>>>>>>> 36390900e852188b1417aad18ac1e20cec9d33ba
*
 */
public class DefaultRepositoryFactory extends JpaRepositoryFactory {
	private final EntityManager entityManager;
	public DefaultRepositoryFactory(EntityManager entityManager) {
		super(entityManager);
		Assert.notNull(entityManager);
		this.entityManager = entityManager;
	}
	
	@Override
	protected Object getTargetRepository(RepositoryInformation information) {	
		JpaEntityInformation<?, Serializable> entityInformation = getEntityInformation(information.getDomainType());
		return new GenericRepositoryImpl(entityInformation, entityManager); // custom implementation
	}
	
	
	@Override
	protected Class<?> getRepositoryBaseClass(RepositoryMetadata metadata) {
		return GenericRepositoryImpl.class;
	}
}
