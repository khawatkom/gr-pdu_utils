/* -*- c++ -*- */
/*
 * Copyright 2018 National Technology & Engineering Solutions of Sandia, LLC (NTESS). Under the terms of Contract DE-NA0003525 with NTESS, the U.S. Government retains certain rights in this software.
 *
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */


 /* @WARNING@ */

#ifndef @GUARD_NAME@
#define @GUARD_NAME@

#include <pdu_utils/@BASE_NAME@.h>
#include <pdu_utils/constants.h>

namespace gr {
  namespace pdu_utils {

    class @IMPL_NAME@ : public @BASE_NAME@
    {
     private:
      pmt::pmt_t d_msg_port_out;
      bool d_early_burst_err;
      bool d_drop_early_bursts;
      bool d_tag_sob;
      int d_type;
      uint32_t d_itemsize;
      uint32_t d_max_queue_size;
      uint32_t d_drop_ctr;
      pmt::pmt_t d_time_tag;
      std::list<pmt::pmt_t> d_pdu_queue;

      std::vector<@O_TYPE@> d_data;

      uint32_t queue_data(void);

     public:
      void set_max_queue_size(uint32_t size) { d_max_queue_size = size; }

      void store_pdu(pmt::pmt_t pdu);
      @IMPL_NAME@(uint32_t early_burst_behavior, uint32_t max_queue_size);
      ~@IMPL_NAME@();

      // Where all the action really happens
      int work(int noutput_items,
         gr_vector_const_void_star &input_items,
         gr_vector_void_star &output_items);
    };

  } // namespace bd
} // namespace gr

#endif /* @GUARD_NAME@ */
