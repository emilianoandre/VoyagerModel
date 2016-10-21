/**
 * @author EAndre
 *
 */
package com.voyagerproject.dao.interfaces;

import java.util.Collection;

import com.voyagerproject.exceptions.ResultNotFoundException;

public interface IVoyagerDao<T> {
	
	/**
	 * Persists the instance to the DB
	 * 
	 * @param transientInstance
	 */
	public Integer persist(T transientInstance);
	
	/**
	 * Removes the instance from the DB
	 * 
	 * @param transientInstance
	 */
	public void remove(T transientInstance);
	
	/**
	 * Merges the instance with the new instance in the DB
	 * 
	 * @param transientInstance
	 * @return Merged instance
	 */
	public T merge(T transientInstance);
	
	/**
	 * Finds and instance by it's id
	 * 
	 * @param id
	 * @return instance
	 */
	public T findById(int id) throws ResultNotFoundException;
	
	/**
	 * Returns the complete list of entities
	 * 
	 * 
	 * @return instance
	 */
	public Collection<T> getList();

}
