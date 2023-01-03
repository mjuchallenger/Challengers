package valueObject;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ParentVO {
	public ParentVO set(ResultSet resultSet) {
		Field[] fields = this.getClass().getDeclaredFields();
		for(int i=0; i<fields.length; i++) {
			try {
				fields[i].setAccessible(true);
				fields[i].set(this, resultSet.getString(i+1));
			} catch (IllegalArgumentException | IllegalAccessException | SQLException e) {e.printStackTrace();}
		}
		return this;
	}
}
