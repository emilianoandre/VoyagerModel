package com.voyagerproject.dao;
// Generated Feb 28, 2016 12:50:47 PM by Hibernate Tools 4.3.1.Final

import java.util.Collection;

import javax.ejb.Stateless;
import javax.persistence.Query;

import org.apache.log4j.Logger;

import com.voyagerproject.dao.interfaces.IVoyagerDao;
import com.voyagerproject.exceptions.ResultNotFoundException;
import com.voyagerproject.model.UserType;

/**
 * Home object for domain model class UserType.
 * @see com.voyagerproject.model.UserType
 * @author Hibernate Tools
 */
@Stateless
public class UserTypeDAO extends VoyagerDAO implements IVoyagerDao<UserType>{

	private static final Logger log = Logger.getLogger(UserTypeDAO.class);
	
	public Integer persist(UserType transientInstance) {
		log.debug("persisting UserType instance");
		try {
			getEntityManager().getTransaction().begin();
			getEntityManager().persist(transientInstance);
			getEntityManager().getTransaction().commit();
			log.debug("persist successful");
			return transientInstance.getIdUserType();
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(UserType persistentInstance) {
		log.debug("removing UserType instance");
		try {
			getEntityManager().getTransaction().begin();
			getEntityManager().remove(persistentInstance);
			getEntityManager().getTransaction().commit();
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public UserType merge(UserType detachedInstance) {
		log.debug("merging UserType instance");
		try {
			getEntityManager().getTransaction().begin();
			UserType result = getEntityManager().merge(detachedInstance);
			getEntityManager().getTransaction().commit();
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public UserType findById(int id) throws ResultNotFoundException {
		log.debug("getting UserType instance with id: " + id);
		try {
			UserType instance = getEntityManager().find(UserType.class, id);
			if (instance == null) {
				log.debug("UserType: " + id + " not found");
				throw new ResultNotFoundException("UserType: " + id + " not found");
			}
			log.debug("get successful");
			return instance;
		}  catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public Collection<UserType> getList() {
		log.debug("getting all UserTypes");
		try {			
			Query query = getEntityManager().createQuery("SELECT ut FROM UserType ut");			
			Collection<UserType> resultList = (Collection<UserType>) query.getResultList();
			log.debug("get successful");
			return resultList;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}		
	}
}
