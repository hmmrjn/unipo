package models;

public class Textbook implements Comparable<Textbook> {

	private int textbookID;
	private String name;
	private String reading;
	private Course course;
	private int price;
	private int stock;
	private int likes;
	private int dislikes;

	public Textbook(int textbookID, String name, String reading, Course course, int price, int stock, int likes,
			int dislikes) {
		super();
		this.textbookID = textbookID;
		this.name = name;
		this.reading = reading;
		this.course = course;
		this.price = price;
		this.stock = stock;
		this.likes = likes;
		this.dislikes = dislikes;
	}

	public int getTextbookID() {
		return textbookID;
	}

	public void setTextbookID(int textbookID) {
		this.textbookID = textbookID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getReading() {
		return reading;
	}

	public void setReading(String reading) {
		this.reading = reading;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getDislikes() {
		return dislikes;
	}

	public void setDislikes(int dislikes) {
		this.dislikes = dislikes;
	}

	@Override
	public String toString() {
		return "Textbook [textbookID=" + textbookID + ", name=" + name + ", reading=" + reading + ", course=" + course
				+ ", price=" + price + ", stock=" + stock + ", likes=" + likes + ", dislikes=" + dislikes + "]";
	}

	public int compareTo(Textbook another) {
		int anotherDate = another.getCourse().getDayOfWeek();
		int anotherHour = another.getCourse().getHour();
		if (course.getDayOfWeek() < anotherDate) {
			return -1;
		} else if (course.getDayOfWeek() > anotherDate) {
			return 1;

		} else {
			if (course.getHour() < anotherHour) {

				return -1;
			} else if (course.getHour() > anotherHour) {
				return 1;
			} else
				return 0;
		}
	}
}
