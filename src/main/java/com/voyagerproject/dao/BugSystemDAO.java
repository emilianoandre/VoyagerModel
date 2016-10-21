package com.voyagerproject.dao;
// Generated Feb 27, 2016 12:34:42 PM by Hibernate Tools 4.3.1.Final

import java.util.Collection;

import javax.ejb.Stateless;
import javax.persistence.Query;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.voyagerproject.dao.interfaces.IVoyagerDao;
import com.voyagerproject.exceptions.ResultNotFoundException;
import com.voyagerproject.model.BugSystem;

/**
 * Home object for domain model class BugSystem.
 * @see com.voyagerproject.model.BugSystem
 * @author Hibernate Tools
 */
@Stateless
public class BugSystemDAO extends VoyagerDAO implements IVoyagerDao<BugSystem> {

	private static final Log log = LogFactory.getLog(BugSystemDAO.class);

	public Integer persist(BugSystem transientInstance) {
		log.debug("persisting BugSystem instance");
		try {
			getEntityManager().getTransaction().begin();
			getEntityManager().persist(transientInstance);
			getEntityManager().getTransaction().commit();
			log.debug("persist successful");
			return transientInstance.getIdBugSystem();
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(BugSystem persistentInstance) {
		log.debug("removing BugSystem instance");
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

	public BugSystem merge(BugSystem detachedInstance) {
		log.debug("merging BugSystem instance");
		try {
			getEntityManager().getTransaction().begin();
			BugSystem result = getEntityManager().merge(detachedInstance);
			getEntityManager().getTransaction().commit();
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public BugSystem findById(int id) throws ResultNotFoundException {
		log.debug("getting BugSystem instance with id: " + id);
		try {
			BugSystem instance = getEntityManager().find(BugSystem.class, id);
			if (instance == null) {
				log.debug("BugSystem: " + id + " not found");
				throw new ResultNotFoundException("BugSystem: " + id + " not found");
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
	public Collection<BugSystem> getList() {
		log.debug("getting all BugSystems");
		try {			
			Query query = getEntityManager().createQuery("SELECT bs FROM BugSystem bs");			
			Collection<BugSystem> resultList = (Collection<BugSystem>) query.getResultList();
			log.debug("get successful");
			return resultList;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
