package com.dongguk.Raview.dao;

import java.util.List;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;

public interface IImageDao {
	public List<Entity> listDao();
	public void writeDao(String key, String time, String base64, String countCar);
	public Entity getDao(String key);
	public void deleteDao(String key);
}