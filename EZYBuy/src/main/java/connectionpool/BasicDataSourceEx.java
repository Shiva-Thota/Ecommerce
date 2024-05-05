package connectionpool;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.commons.dbcp2.BasicDataSource;

public class BasicDataSourceEx {

	private static BasicDataSource datasource ;
	static {
		Properties pr=new Properties();
		try {
			pr.load(new FileInputStream("C:\\Users\\thota\\eclipse-workspaceEnterprise\\EZYBuy\\src\\main\\java\\Credentials.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		datasource=new BasicDataSource();
		datasource.setDriverClassName(pr.getProperty("Driver_Url"));
		datasource.setUrl(pr.getProperty("jdbc_Url"));
		datasource.setUsername(pr.getProperty("user"));
		datasource.setPassword(pr.getProperty("password"));
		datasource.setInitialSize(6);
		datasource.setMinIdle(2);
		datasource.setMaxIdle(5);
		datasource.setTestOnBorrow(true);
	}
	public static Connection getConnection() throws SQLException {
		return datasource.getConnection();
	}
}
