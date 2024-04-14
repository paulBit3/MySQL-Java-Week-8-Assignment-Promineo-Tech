package projects;

import java.sql.Connection;

import projects.dao.DbConnection;

public class ProjectsApp {

	public static void main(String[] args) {
		
		// creating a new connection
		 DbConnection.connectDB();
		 
		 // When connection to server goes through,
		 // That will display... Connection to schema projects is successful.

	}

}
