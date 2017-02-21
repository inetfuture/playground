package com.example.aaron.listview;

import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class RecyclerViewAdapter extends RecyclerView.Adapter<RecyclerViewAdapter.ViewHolder> {

  private String[] mItems;

  public static class ViewHolder extends RecyclerView.ViewHolder {
    public RelativeLayout mItemView;
    public ViewHolder(RelativeLayout itemView) {
      super(itemView);
      mItemView = itemView;
    }
  }

  public RecyclerViewAdapter(String[] items) {
    mItems = items;
  }

  @Override
  public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
    
  }

  @Override
  public void onBindViewHolder(ViewHolder holder, int position) {

  }

  @Override
  public int getItemCount() {
    return 0;
  }

}
