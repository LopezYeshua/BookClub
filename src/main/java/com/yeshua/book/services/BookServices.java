package com.yeshua.book.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeshua.book.models.Book;
import com.yeshua.book.repositories.BookRepository;

@Service
public class BookServices {
	@Autowired
	BookRepository bookRepository;
	
	public Book createBook(Book book) {
		return bookRepository.save(book);
	}
	
	public List<Book> findBooks() {
		return bookRepository.findAll();
	}
	
	public Book findBook(Long id) {
		Optional<Book> optionalBook = bookRepository.findById(id);
		if (optionalBook.isPresent()) {
			return optionalBook.get();
		}
		return null;
	}
	
	 // updates a book
    public Book updateBook(Book book) {
    	Book bookInDB = bookRepository.findById(book.getId()).get();
    	bookInDB.setTitle(book.getTitle());
    	bookInDB.setAuthor(book.getAuthor());
    	bookInDB.setThoughts(book.getThoughts());
    	return bookRepository.save(bookInDB);
    }
}
