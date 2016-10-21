package com.voyagerproject.dao;
// Generated Feb 27, 2016 12:34:42 PM by Hibernate Tools 4.3.1.Final

import java.util.Collection;

import javax.ejb.Stateless;
import javax.persistence.Query;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.voyagerproject.dao.interfaces.IVoyagerDao;
import com.voyagerproject.exceptions.ResultNotFoundException;
import com.voyagerproject.model.Permission;

/**
 * Home object for domain model class Permission.
 * @see com.voyagerproject.model.Permission
 * @author Hibernate Tools
 */
@Stateless
public class PermissionDAO extends VoyagerDAO implements IVoyagerDao<Permission> {

	private static final Log log = LogFactory.getLog(PermissionDAO.class);

	public Integer persist(Permission transientInstance) {
		log.debug("persisting Permission instance");
		try {
			getEntityManager().getTransaction().begin();
			getEntityManager().persist(transientInstance);
			getEntityManager().getTransaction().commit();
			log.debug("persist successful");
			return transientInstance.getIdPermission();
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Permission persistentInstance) {
		log.debug("removing Permission instance");
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

	public Permission merge(Permission detachedInstance) {
		log.debug("merging Permission instance");
		try {
			getEntityManager().getTransaction().begin();
			Permission result = getEntityManager().merge(detachedInstance);
			getEntityManager().getTransaction().commit();
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Permission findById(int id) throws ResultNotFoundException {
		log.debug("getting Permission instance with id: " + id);
		try {
			Permission instance = getEntityManager().find(Permission.class, id);
			if (instance == null) {
				log.debug("Permission: " + id + " not found");
				throw new ResultNotFoundException("Permission: " + id + " not found");
			}
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Collection<Permission> getList() {
		log.debug("getting all Permissions");
		try {			
			Query query = getEntityManager().createQuery("SELECT p FROM Permission p");			
			Collection<Permission> resultList = (Collection<Permission>) query.getResultList();
			log.debug("get successful");
			return resultList;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
