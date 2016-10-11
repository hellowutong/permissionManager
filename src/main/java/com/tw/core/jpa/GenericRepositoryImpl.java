package com.tw.core.jpa;

import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;


import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
* @ClassName: GenericRepositoryImpl 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author TonyWoo
* @date 2016年10月11日 下午2:05:20 
* 
* @param <T>
* @param <ID>
 */
@NoRepositoryBean
public class GenericRepositoryImpl<T, ID extends Serializable> extends SimpleJpaRepository<T, ID>
		implements GenericRepository<T, ID> {
	private final EntityManager em;
	private final Class<T> entityClass;
	private final String entityName;

	public GenericRepositoryImpl(final JpaEntityInformation<T, ?> entityInformation, EntityManager entityManager) {
		super(entityInformation, entityManager);
		this.em = entityManager;
		this.entityClass = entityInformation.getJavaType();
		this.entityName = entityInformation.getEntityName();
	}

	/**
	 * 构造函数
	 * 
	 * @param domainClass
	 * @param em
	 */
	public GenericRepositoryImpl(Class<T> domainClass, EntityManager em) {
		this(JpaEntityInformationSupport.getEntityInformation(domainClass, em), em);
	}

	public Query hqlExecute(String hql, Object... params) {
		Query query = em.createQuery(hql);
		if (null != params && params.length >= 1) {
			for (int i = 1; i <= params.length; i++) {
				query.setParameter(i, params[i - 1]);
			}
		}
		return query;
	}

	public Query sqlExecute(String sql, Object... params) {
		Query query = em.createNativeQuery(sql);
		for (int i = 1; i <= params.length; i++) {
			query.setParameter(i, params[i - 1]);
		}
		return query;
	}

	public void batchSave(List<T> list) {
		for (int i = 0; i < list.size(); i++) {
			em.persist(list.get(i));
			if (i % 10000 == 0) {
				em.flush();
				em.clear();
			}
		}
	}

	public void batchUpdate(List<T> list) {
		for (int i = 0; i < list.size(); i++) {
			em.merge(list.get(i));
			if (i % 10000 == 0) {
				em.flush();
				em.clear();
			}
		}
	}

	@Override
	public EntityManager getEntityManager() {
		
		return this.em;
	}

}
