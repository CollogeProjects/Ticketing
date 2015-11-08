package database;
import java.io.File;
import java.util.ArrayList;

import javax.xml.xquery.XQConnection;
import javax.xml.xquery.XQDataSource;
import javax.xml.xquery.XQException;
import javax.xml.xquery.XQExpression;
import javax.xml.xquery.XQResultSequence;

import entity.Movie;
import net.sf.saxon.xqj.SaxonXQDataSource;

public class QueryMovies {
public  ArrayList query() throws XQException {
	int length;
	String path;
	String[] result;
    ArrayList movies=new ArrayList();
	XQConnection conn=null;
	XQExpression expression=null;
	XQResultSequence resultSeq=null;
	XQDataSource dataSource=new SaxonXQDataSource();
	conn=dataSource.getConnection();
	expression=conn.createExpression();
	length=this.getClass().getClassLoader().getResource("").getPath().length()-17;
	path="../webapps/Ticketing/ShowList.xml";
	resultSeq=expression.executeQuery("for $Movie in doc('"+path+"')/ShowList/Movie return concat(concat(concat(concat(concat(concat(concat(concat(concat(string($Movie/Name),'、'),concat(string($Movie/Poster),'、')),concat(string($Movie/Director),'、')),concat(string($Movie/Actor),'、')),concat(string($Movie/Type),'、')),concat(string($Movie/Price),'、')),concat(string($Movie/Schedule/@data),'、')),concat(string($Movie/Schedule/Item1),'、')),concat(string($Movie/Schedule/Item2),'、'))");
	while(resultSeq.next()){
		   Movie  movie=new Movie();
		   result=resultSeq.getAtomicValue().split("、");
           movie.setName(result[0]);
           movie.setPoster(result[1]);
           movie.setDirector(result[2]);
           movie.setActor(result[3]);
           movie.setType(result[4]);
           movie.setPrice(Integer.valueOf(result[5]));
           movie.setData(result[6]);
           movie.setItemOne(result[7]);
           movie.setItemTwo(result[8]);
           movies.add(movie);

	}
	try {
		if(resultSeq!=null)
		{
			resultSeq.close();
			expression.close();
			conn.close();
		}
	} catch (XQException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
	
 return movies;
}
}
