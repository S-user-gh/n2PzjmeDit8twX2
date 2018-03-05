package com.tracker.StartApp.repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tracker.StartApp.model.Users;

@Repository
@Transactional
public class UsersRepository {

	@Autowired
	private EntityManager entityManager;

	public Users findUserAccount(String userName) {
		try {
			String sql = "Select e from " + Users.class.getName() + " e Where e.userName = :userName ";

			Query query = entityManager.createQuery(sql, Users.class);
			query.setParameter("userName", userName);

			return (Users) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
