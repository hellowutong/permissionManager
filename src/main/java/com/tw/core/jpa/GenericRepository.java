package com.tw.core.jpa;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface GenericRepository<T, ID extends Serializable>
		extends JpaRepository<T, ID>, JpaSpecificationExecutor<T> {
	Query hqlExecute(String hql, Object... params);

	Query sqlExecute(String sql, Object... params);

	void batchSave(List<T> list);

	void batchUpdate(List<T> list);

	EntityManager getEntityManager();
}
