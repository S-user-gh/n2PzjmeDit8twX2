package com.tracker.StartApp.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tracker.StartApp.model.Role;

@Repository
@Transactional
public class RoleRepository {

	@Autowired
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	public List<String> getRoleNames(Long userId) {
		List<String> list = new ArrayList<>();
		String sql = "Select ur.roles.roleName from " + Role.class.getName() + " ur where ur.users.userId = :userId ";

		Query query = this.entityManager.createQuery(sql, String.class);
		query.setParameter("userId", userId);
		list = ((List<String>) query.getResultList());
		return list;
	}
}
