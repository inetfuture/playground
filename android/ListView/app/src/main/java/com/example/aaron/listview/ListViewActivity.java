package com.example.aaron.listview;

import android.Manifest;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.os.Build;
import android.provider.ContactsContract;
import android.support.v4.app.LoaderManager;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.SimpleCursorAdapter;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.Toast;

public class ListViewActivity extends AppCompatActivity implements LoaderManager.LoaderCallbacks<Cursor> {

  ViewGroup mRoot;

  ListView mListView;

  SimpleCursorAdapter mAdapter;

  static final int PERMISSIONS_REQUEST_READ_CONTACTS = 1;

  static final String[] PROJECTION = {ContactsContract.Contacts._ID, ContactsContract.Contacts.DISPLAY_NAME};

  static final String SELECTION = "((" +
      ContactsContract.Contacts.DISPLAY_NAME + " NOTNULL) AND (" +
      ContactsContract.Contacts.DISPLAY_NAME + " != ''))";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);

    mRoot = (ViewGroup) findViewById(R.id.activity_main);
    mListView = (ListView) findViewById(R.id.listView);

    ProgressBar progressBar = new ProgressBar(this);
    progressBar.setIndeterminate(true);
    mListView.setEmptyView(progressBar);
    mRoot.addView(progressBar);

    String[] fromColumns = {ContactsContract.Contacts.DISPLAY_NAME};
    int[] toViews = {R.id.display_name};
    mAdapter = new SimpleCursorAdapter(this, R.layout.list_view_item, null, fromColumns, toViews, 0);
    mListView.setAdapter(mAdapter);

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M &&
        checkSelfPermission(Manifest.permission.READ_CONTACTS) != PackageManager.PERMISSION_GRANTED) {
      requestPermissions(new String[]{Manifest.permission.READ_CONTACTS}, PERMISSIONS_REQUEST_READ_CONTACTS);
    } else {
      getSupportLoaderManager().initLoader(0, null, this);
    }
  }

  @Override
  public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
    if (requestCode == PERMISSIONS_REQUEST_READ_CONTACTS) {
      if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
        getSupportLoaderManager().initLoader(0, null, this);
      } else {
        Toast.makeText(this, "Until you grant the permission, we canot display the contacts", Toast.LENGTH_SHORT)
            .show();
      }
    }
  }

  @Override
  public Loader<Cursor> onCreateLoader(int i, Bundle bundle) {
    Log.d("ListView", "onCreateLoader");
    return new CursorLoader(this, ContactsContract.Contacts.CONTENT_URI, PROJECTION, SELECTION, null, null);
  }

  @Override
  public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
    Log.d("ListView", "onLoadFinished");
    mAdapter.swapCursor(cursor);
  }

  @Override
  public void onLoaderReset(Loader<Cursor> loader) {
    Log.d("ListView", "onLoaderReset");
    mAdapter.swapCursor(null);
  }
}
