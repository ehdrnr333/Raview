package com.dongguk.Raview.dao;

import java.util.List;

import com.google.appengine.api.datastore.DatastoreFailureException;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.SortDirection;

public class ImageDao implements IImageDao {

	@Override
	public void writeDao(String key, String time, String countCar, String base64) {
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Entity post = new Entity("Image", key);
		post.setProperty("time", time);
		post.setProperty("countCar", countCar);
		post.setProperty("base64", base64);

		try {
			datastore.put(post);
		} catch (DatastoreFailureException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Entity getDao(String key) {
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Key k1 = KeyFactory.createKey("Image", key);
		Entity employee = null;
		try {
			employee = datastore.get(k1);
		} catch (EntityNotFoundException e) {
			e.printStackTrace();
		}
		return employee;
	}

	@Override
	public List<Entity> listDao() {
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("Image").addSort("time", SortDirection.DESCENDING);
		PreparedQuery pq = datastore.prepare(q);
		return pq.asList(FetchOptions.Builder.withDefaults());
	}

	@Override
	public void deleteDao(String key) {
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Key k1 = KeyFactory.createKey("Image", key);
		datastore.delete(k1);
	}
}
